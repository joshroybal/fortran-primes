module primes
    implicit none
    contains
        ! Function result location stores smallest divisor of n.
        function smallest_divisor(n) result(sd)
            ! dummy argument
            integer (kind=16), intent(in) :: n
            ! function result location
            integer (kind=16) :: sd
            ! local data
            integer (kind=16) :: i, supremum
            ! processing
            supremum = int(sqrt(real(n)), 16)
            sd = n
            if (modulo(n, 2_16) .eq. 0) then
                sd = 2
            else if (modulo(n, 3_16) .eq. 0) then
                sd = 3
            else
                i = 5
                do while (sd .eq. n .and. i .le. supremum)
                    if (modulo(n, i) .eq. 0) then
                        sd = i
                    else if (modulo(n, i+2) .eq. 0) then
                        sd = i+2
                    end if
                    i = i+6
                end do
            end if
        end function smallest_divisor

        ! primality predicate function
        function prime(n) result(res)
            ! dummy argument
            integer (kind=16), intent(in) :: n
            ! function result location
            logical :: res
            ! local data
            integer (kind=16) :: i
            ! processing
            if (n .le. 1_16 .or. smallest_divisor(n) .ne. n) then
                res = .false.
            else
                res = .true.
            end if
        end function prime

        function next_prime(n) result(p)
            integer (kind=16), intent(in) :: n
            integer (kind=16) :: p
            integer (kind=16) :: i

            i = n+1
            do
                if (prime(i)) then
                    p = i
                    exit
                end if
                i = i+1
            end do
        end function next_prime

        ! Function returns left adjusted string representation of no. n.
        function write_to_string(n) result(string)
            ! dummy argument
            integer (kind=16), intent (in) :: n
            ! function result location
            character (len=41) :: string
            ! processing
            write (string,*) n
            string = adjustl(string)
        end function write_to_string

        ! prime factorization subroutine
        subroutine factorize(n)
            ! dummy argument
            integer (kind=16), intent(in) :: n
            ! local data
            integer (kind=16) :: factor, rest
            ! processing
            write (*,1000,advance='no') trim(write_to_string(n))//':'

            if (n .gt. 1) then
                factor = smallest_divisor(n)
                rest = n/factor;
                write (*,1000,advance='no') trim(write_to_string(factor))
                do while ((rest .ne. 1) .and. (.not. prime(rest)))
                    factor = smallest_divisor(rest)
                    write (*,1000,advance='no') trim(write_to_string(factor))
                    rest = rest/factor
                end do
                if (prime(rest)) then
                    write (*,1000) trim(write_to_string(rest))
                else
                    write (*,*)
                end if
            end if

            1000 format (1X,A)
        end subroutine factorize
end module primes
