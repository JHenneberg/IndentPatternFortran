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
    INTEGER, INTENT(OUT) :: j

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
    INTEGER, INTENT(OUT) :: j(:)

    IF (ALL(i > 10)) j = i

    WHERE (i > 10) &
      j = i
  END SUBROUTINE IndentOneLineKeywords
END MODULE myModule
```
