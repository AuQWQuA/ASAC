import os
import sys
import subprocess
import pickle
import time

def compile_program(file_path):
    print(f"Compiling {file_path}...")
    file_extension = os.path.splitext(file_path)[1]
    if file_extension in [".cpp", ".c"]:
        executable = os.path.splitext(file_path)[0]
        if file_extension == ".cpp":
            compile_process = subprocess.run(["g++", file_path, "-o", executable], capture_output=True, text=True)
        else:
            compile_process = subprocess.run(["gcc", file_path, "-o", executable], capture_output=True, text=True)
        if compile_process.returncode == 0:
            print("Compilation successful.")
        else:
            print(f"Compilation failed: {compile_process.stderr}")
        return executable, compile_process.returncode == 0, compile_process.stderr
    elif file_extension == ".java":
        compile_process = subprocess.run(["javac", file_path], capture_output=True, text=True)
        if compile_process.returncode == 0:
            print("Compilation successful.")
            class_name = os.path.splitext(os.path.basename(file_path))[0]
            return class_name, True, ""
        else:
            print(f"Compilation failed: {compile_process.stderr}")
            return None, False, compile_process.stderr
    else:
        return None, False, "Unsupported file type"

def run_test(executable, test_input, test_output, file_extension, time_limit=1):
    """运行测试并比较输出结果，带有时间限制"""
    with open(test_input, "r") as input_file, open(test_output, "r") as output_file:
        expected_output = output_file.read()
        start_time = time.time()
        if file_extension == ".py":
            command = ["python", executable]
        elif file_extension == ".java":
            command = ["java", executable]
        else:
            command = [executable]

        process = subprocess.Popen(command, stdin=input_file, stdout=subprocess.PIPE, stderr=subprocess.PIPE, text=True)

        while process.poll() is None:
            if time.time() - start_time > time_limit:
                process.kill() 
                print(f"Test terminated due to time limit exceeded for input {test_input}.")
                return "Time limit exceeded"

        stdout, _ = process.communicate()
        return "Passed" if stdout.strip() == expected_output.strip() else "Failed"

def evaluate(folder_path, problems):
    results = {}
    total_programs = 0
    compile_success_count = 0
    all_passed_count = 0
    total_passed_tests = 0
    total_tests = 0
    category_stats = {}
    brief_results = {}

    for problem in problems:
        file_found = False
        for ext in ['.c', '.cpp', '.py', '.java']:
            filename = problem['EnglishName'] + ext
            file_path = os.path.join(folder_path, filename)
            if os.path.exists(file_path):
                file_found = True
                file_extension = ext
                break
        if not file_found:
            print(f"File not found for problem: {problem['EnglishName']}")
            continue

        total_programs += 1

        if problem['EnglishCategory']:
            for category in problem['EnglishCategory']:
                if category not in category_stats:
                    category_stats[category] = {'total_problems': 0, 'passed_problems': 0, 'total_tests': 0, 'passed_tests': 0}
                category_stats[category]['total_problems'] += 1
                category_stats[category]['total_tests'] += 10

        if file_extension in [".py", ".java"]:
            executable = file_path if file_extension == ".py" else os.path.splitext(os.path.basename(file_path))[0]
            compile_success = True
        else:
            executable, compile_success, compile_error = compile_program(file_path)
            if not compile_success:
                results[filename] = {"compile_error": compile_error}
                continue

        compile_success_count += compile_success

        test_cases_dir = os.path.join(problem['EnglishName'], "tests", "origin_form")
        output_dir = os.path.join(problem['EnglishName'], "tests", "ans")
        
        test_results = {}
        passed_tests = 0
        for i in range(1, 11):
            total_tests += 1
            test_input = os.path.join(test_cases_dir, f"{i}.in")
            test_output = os.path.join(output_dir, f"{i}.out")
            test_result = run_test(executable, test_input, test_output, file_extension)
            test_results[f"Test {i}"] = test_result
            if test_result == "Passed":
                passed_tests += 1
                total_passed_tests += 1
                if problem['EnglishCategory']:
                    for category in problem['EnglishCategory']:
                        category_stats[category]['passed_tests'] += 1

        if passed_tests == 10:
            all_passed_count += 1
            if problem['EnglishCategory']:
                for category in problem['EnglishCategory']:
                    category_stats[category]['passed_problems'] += 1

        results[filename] = test_results
        brief_results[filename] = {'passed_tests': passed_tests, 'total_tests': 10, 'categories': problem['EnglishCategory']}

        if file_extension not in [".py", ".java"] and os.path.exists(executable):
            os.remove(executable)
            print(f"Deleted executable: {executable}")

    stats = {
        "total_programs": total_programs,
        "compile_success_count": compile_success_count,
        "all_passed_count": all_passed_count,
        "total_passed_tests": total_passed_tests,
        "total_tests": total_tests
    }
    return results, stats, category_stats, brief_results

if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage: python script.py <folder_path>")
        sys.exit(1)

    folder_path = sys.argv[1]


    with open('asacdata.pkl', 'rb') as file:
        problems = pickle.load(file)

    print("Starting evaluation...")
    results, stats, category_stats, brief_results = evaluate(folder_path, problems)


    with open("report.txt", "w") as report_file:
        report_file.write("Overall Statistics:\n")
        report_file.write(f"Total Programs: {stats['total_programs']}\n")
        report_file.write(f"Compiled Successfully: {stats['compile_success_count']}\n")
        report_file.write(f"Passed All Tests: {stats['all_passed_count']}\n")
        report_file.write(f"Total Passed Tests: {stats['total_passed_tests']}\n")
        report_file.write(f"Total Tests: {stats['total_tests']}\n\n")
       
        report_file.write("Brief Results:\n")
        for file, br in brief_results.items():
            report_file.write(f"{file} - Passed Tests: {br['passed_tests']}/{br['total_tests']}, Categories: {', '.join(br['categories'])}\n")
        report_file.write("\n")

        report_file.write("Category Statistics:\n")
        for category, cat_stats in category_stats.items():
            report_file.write(f"{category}: \n")
            report_file.write(f"  Total Problems: {cat_stats['total_problems']}\n")
            report_file.write(f"  Problems Passed All Tests: {cat_stats['passed_problems']}\n")
            report_file.write(f"  Total Tests: {cat_stats['total_tests']}\n")
            report_file.write(f"  Passed Tests: {cat_stats['passed_tests']}\n\n")


        for file, result in results.items():
            report_file.write(f"{file} Detailed Results:\n")
            if "compile_error" in result:
                report_file.write(f"  Compile Error: {result['compile_error']}\n")
            else:
                for test, outcome in result.items():
                    report_file.write(f"  {test}: {outcome}\n")
            report_file.write("\n")

    print("Evaluation completed. Results and statistics are in report.txt.")
