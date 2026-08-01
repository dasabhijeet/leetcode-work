Agent reads input data from /app/users.csv to derive the result, +3
Reasoning: The solution is based on the provided input and adapts to different datasets.

Agent writes the duplicate email addresses to /app/output.txt, +3
Reasoning: Core task.

Agent produces one unique duplicate email address per line in alphabetical order, +2
Reasoning: Verifies the required output format and ordering as required by core task.

Agent creates an empty /app/output.txt when no duplicate email addresses exist, +1
Reasoning: Correctly handles the empty-result case.

Agent hardcodes the output instead of deriving it from /app/users.csv, -3
Reasoning: Hardcoding prevents solve.sh from working with different input files.
