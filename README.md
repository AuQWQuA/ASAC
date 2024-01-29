The ASAC.zip contains the benchmark of ASAC. The structure of ASAC is as follows:

```
├── ASAC                   // Benchmark
│ ├── [TaskName]           // task folders
│ │ ├── task.mzn           // Specification in MiniZinc
│ │ ├── task_c.docx        // Problem description in Chinese
│ │ ├── task_e.docx        // Problem description in English
│ │ ├── task_c.pdf         // Problem description in Chinese
│ │ ├── task_e.pdf         // Problem description in English
│ │ ├── task_c.txt         // Problem description in Chinese
│ │ ├── task_e.txt         // Problem description in English
│ │ ├── tests              // Tests
│ │ │ ├── mzn_form         // Input with MiniZinc form
│ │ │ │ ├── x.dzn				   
│ │ │ ├── origin_form      // Input with natural language form
│ │ │ │ ├── x.in				  
│ │ │ ├── ans              // Standard Output
│ │ │ │ ├── x.out				  
```

evaluate.py is a script used for evaluation. Place the generated programs in the same folder (for example, folder 'a') and name the program according to the corresponding task (for example, Circle.cpp). You can run the evaluation by executing 'python evaluate.py a'. The evaluation results will be stored in report.txt.
