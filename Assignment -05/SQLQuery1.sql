-- Create SubjectAllotments table
CREATE TABLE SubjectAllotments (
    StudentID VARCHAR(50),
    SubjectID VARCHAR(50),
    Is_Valid BIT
);

-- Create SubjectRequest table
CREATE TABLE SubjectRequest (
    StudentID VARCHAR(50),
    SubjectID VARCHAR(50)
);
