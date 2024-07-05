CREATE PROCEDURE UpdateSubjectAllotment
    @StudentID VARCHAR(50),
    @RequestedSubjectID VARCHAR(50)
AS
BEGIN
    -- Check if the requested subject is already the valid one
    IF EXISTS (SELECT 1 FROM SubjectAllotments WHERE StudentID = @StudentID AND SubjectID = @RequestedSubjectID AND Is_Valid = 1)
    BEGIN
        -- If the requested subject is already valid, do nothing
        PRINT 'Requested subject is already the valid subject.'
    END
    ELSE
    BEGIN
        -- Mark the current valid subject as invalid
        UPDATE SubjectAllotments
        SET Is_Valid = 0
        WHERE StudentID = @StudentID AND Is_Valid = 1;

        -- Insert the new requested subject as valid
        INSERT INTO SubjectAllotments (StudentID, SubjectID, Is_Valid)
        VALUES (@StudentID, @RequestedSubjectID, 1);
    END
END;
