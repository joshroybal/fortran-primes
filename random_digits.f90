! returns a random number of n digits length
function random_digits(nd) result(rnd)
    implicit none
    ! dummy argument
    integer, intent(in) :: nd
    ! function result location
    integer (kind=16) :: rnd
    ! local data
    integer :: i, digit
    real :: r
    character (len=12) :: c
    character (len=nd) :: nstr
    ! processing
    nstr = ''
    ! The first digit is in range 1 to 9.
    call random_number(r)
    digit = 1+8*r
    write (c,*) digit
    nstr = adjustl(c)
    ! The rest of the digits are in range 0 to 9.
    do i = 2, nd
        call random_number(r)
        digit = 10*r
        write (c,*) digit
        nstr = trim(nstr)//trim(adjustl(c))
    end do
    read (nstr,*) rnd
end function random_digits
