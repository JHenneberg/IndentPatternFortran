MODULE myModule
  USE myOtherModule
  IMPLICIT NONE
  PRIVATE
  PUBLIC :: myType
  PUBLIC :: IndentIfThenElse
  PUBLIC :: IndentOneLineKeywords

  TYPE :: myType
    INTEGER :: myInt = 0
  CONTAINS
    PROCEDURE, PUBLIC :: myTypeSub
  END TYPE
CONTAINS
  SUBROUTINE myTypeSub(this)
    IMPLICIT NONE

    CLASS(this), INTENT(IN) :: myType

    myType%myInt = 10
  END SUBROUTINE myTypeSub

  SUBROUTINE IndentIfThenElse(i, j)
    IMPLICIT NONE

    INTEGER, INTENT(IN) :: i
    INTEGER, INTENT(INOUT) :: j

    IF (i > 10) THEN
      j = i
    ELSE IF (i < 6) THEN
      j = 2
    ELSE
      j = -1
    END IF
  END SUBROUTINE IndentIfThenElse

  SUBROUTINE IndentOneLineKeywords(i, j)
    IMPLICIT NONE

    INTEGER, INTENT(IN) :: i(:)
    INTEGER, INTENT(INOUT) :: j(:)

    IF (ALL(i > 10)) j = i

    WHERE (i > 10) &
      j = i

    IF (SIZE(j) >= 4) &
      FORALL (INTEGER :: k = 1:4) &
        j(k) = 1
  END SUBROUTINE IndentOneLineKeywords
END MODULE myModule