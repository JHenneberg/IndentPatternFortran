MODULE myModule
  USE myOtherModule
  IMPLICIT NONE
  PRIVATE
  PUBLIC :: myType
  PUBLIC :: indentInterface
  PUBLIC :: indentOneLineKeywords
  PUBLIC :: SubroutineTest

  TYPE :: myType
    INTEGER :: myInt = 0
  CONTAINS
    PROCEDURE, PUBLIC :: myTypeSub
  END TYPE

  INTERFACE indentInterface
    PROCEDURE indent
    PROCEDURE indentIfThenElse
  END INTERFACE indentInterface
CONTAINS
  SUBROUTINE myTypeSub(this)
    IMPLICIT NONE

    CLASS(this), INTENT(IN) :: myType

    myType%myInt = 10
  END SUBROUTINE myTypeSub

  SUBROUTINE indentIfThenElse(i, j)
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
  END SUBROUTINE indentIfThenElse

  SUBROUTINE indentSelectCase(i, j)
    IMPLICIT NONE

    INTEGER, INTENT(IN) :: i
    INTEGER, INTENT(INOUT) :: j

    SELECT CASE (i)
    CASE (10)
      j = 2 * i
    CASE (6)
      j = i
    CASE DEFAULT
      j = -1
    END SELECT
  END SUBROUTINE indentSelectCase

  SUBROUTINE indentOneLineKeywords(i, j)
    IMPLICIT NONE

    INTEGER, INTENT(IN) :: i(:)
    INTEGER, INTENT(INOUT) :: j(:)

    IF (ALL(i > 10)) j = i

    WHERE (i > 10) &
      j = i

    IF (SIZE(j) >= 4) &
      FORALL (INTEGER :: k = 1:4) &
        j(k) = 1
  END SUBROUTINE indentOneLineKeywords
  
  SUBROUTINE SubroutineTest(subroutine, end)
    IMPLICIT NONE
    
    INTEGER, INTENT(INOUT) :: subroutine123, end123
    
    subroutine123 = end123
    end123 = subroutine123
    
  END SUBROUTINE SubroutineTest
END MODULE myModule
