% NOIP2005-S T1
% Input
int: n;
% The first line of the input file is an integer N (1 <= N <= 100), indicating the total number of students.
array[1..n] of string: name;
% The following N lines contain data for each student, with each line consisting of the student's name.
array[1..n] of int: score;
% Final average score
array[1..n] of int: review;
% Class review score
array[1..n] of string: if_leader;
% Whether the student is a cadre
array[1..n] of string: if_west;
% Whether the student is from a western province
array[1..n] of int: paper;
% Number of published papers

% Description
array[1..n] of var int: scholarship;

function var int: fellow(int: score, int: paper) =
    if score > 80 /\ paper >= 1 then 8000 else 0 endif;
% Academician Scholarship, 8000 yuan per person, awarded to students with a final average score higher than 80 and who have published 1 or more papers in the current semester.

function var int: mayfourth(int: score, int: review) =
    if score > 85 /\ review > 80 then 4000 else 0 endif;
% May Fourth Scholarship, 4000 yuan per person, awarded to students with a final average score higher than 85 and a class review score higher than 80.

function var int: grade(int: score) =
    if score > 90 then 2000 else 0 endif;
% Outstanding Performance Scholarship, 2000 yuan per person, awarded to students with a final average score higher than 90.

function var int: west(int: score, string: if_west) =
    if score > 85 /\ if_west = "Y" then 1000 else 0 endif;
% Western Scholarship, 1000 yuan per person, awarded to students from western provinces with a final average score higher than 85.

function var int: contribution(int: review, string: if_leader) =
    if review > 80 /\ if_leader = "Y" then 850 else 0 endif;
% Class Contribution Award, 850 yuan per person, awarded to student cadres with a class review score higher than 80.

constraint forall(i in 1..n)(scholarship[i] =
    fellow(score[i], paper[i]) + mayfourth(score[i], review[i]) + grade(score[i]) + west(score[i], if_west[i]) + contribution(review[i], if_leader[i]));
% Students can receive multiple scholarships as long as they meet the criteria, and there is no limit to the number of recipients for each scholarship.

%solve

solve satisfy;

% Output
output[
    "\(name[arg_max(fix(scholarship))])\n" ++
    "\(max(fix(scholarship)))\n" ++
    "\(sum(scholarship))"
];
% The first line is the name of the student who received the most scholarship.
% The second line is the total amount of scholarship received by this student. If there are multiple students with the highest scholarship amount, output the name of the student who appeared first in the input file.
% The third line is the total amount of scholarships received by all N students.
