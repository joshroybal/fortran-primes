! works fine up at least until the quintillions
program driver
    use primes
    implicit none
    ! interface
    interface
        function random_digits(nd) result(rnd)
            integer, intent(in) :: nd
            integer (kind=16) :: rnd
        end function random_digits
    end interface
    ! variables
    integer (kind=16) :: i
    integer :: nd
    ! processing
    do nd = 2, 18
        write (*,*) trim(write_to_string(int(nd, 16))), ' digits'
        do i = 1, 20
            call factorize(random_digits(nd))
        end do
    end do
end program driver
