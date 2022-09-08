! works fine up at least until the quintillions
program driver
    implicit none
    ! variables
    integer :: i
    ! interface
    interface
        subroutine report(n, siz)
            integer, intent(in) :: n, siz
        end subroutine report
    end interface
    ! processing
    call report(10000, 16)
    call report(1000, 32)
    call report(100, 48)
    call report(10, 64)
    call report(1, 80)
end program driver

subroutine report(n, siz)
    use primes
    use prng
    implicit none
    ! dummy arguments
    integer, intent(in) :: n, siz
    ! local data
    integer :: i
    integer (kind=16) :: z
    real :: r
    character (len=12) :: an, asiz
    ! processing
    an = write_to_string(int(n, 16))
    asiz = write_to_string(int(siz, 16))
    write (*,*) 'Factorizing ', trim(an), ' ', trim(asiz), '-bit integers.'
    ! seed = 0
    call random_number(r)
    seed = r*(2_16**(siz-1))
    do i = 1, n
        z = rnd(siz)
        call factorize(z)
    end do
end subroutine report
