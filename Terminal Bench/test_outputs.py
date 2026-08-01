from pathlib import Path

def test_output_file_check():
    """Verify that the output file is created."""
    assert Path("/app/output.txt").exists()

def test_correct_duplicates_check():
    """Verify that the output contains the correct duplicate email addresses."""
    users = Path("/app/users.csv").read_text().splitlines()
    output = Path("/app/output.txt").read_text().splitlines()

    duplicate = []

    for email in users:
        if users.count(email) > 1:
            if email not in duplicate:
                duplicate.append(email)

    duplicate.sort()

    assert output == duplicate