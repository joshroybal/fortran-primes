! works fine up at least until the quintillions
program driver
    use primes
    use rand128
    implicit none
    ! variables
    integer :: i
    ! processing
    do i = 1, 25
        call factorize(random_integer())
    end do
end program driver
