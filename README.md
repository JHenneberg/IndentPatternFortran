# IndentPatternFortran
General indentation patterns for Fortran.

There are some IDEs in which Fortran is programmed (VS Code, Atom, Code::Blocks...), which allow to insert Fortran source code via extensions or directly. However, the basic procedure remains the same. A pattern is recognized via RegEx and indented further or less. This repository is abstract and only provides a collection of RegEx commands, which can be used further.

# Example
## Module
```FORTRAN
MODULE myModule
  USE myOtherModule
  IMPLICIT NONE
  PRIVATE
  PUBLIC :: myType
  PUBLIC :: indent
  PUBLIC :: indentOneLineKeywords

  TYPE :: myType
    INTEGER :: myInt = 0
  CONTAINS
    PROCEDURE, PUBLIC :: myTypeSub
  END TYPE

  INTERFACE indent
    PROCEDURE indent
    PROCEDURE indentIfThenElse
  END INTERFACE
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
END MODULE myModule
```
