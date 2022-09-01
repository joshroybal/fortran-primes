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
                do i = 5, supremum, 6
                    if (modulo(n, i) .eq. 0) then
                        sd = i
                    else if (modulo(n, i+2) .eq. 0) then
                        sd = i+2
                    end if
                    if (sd .ne. n) exit
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
            integer (kind=16) :: i, supremum
            ! processing
            if (n .le. 1 .or. smallest_divisor(n) .ne. n) then
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
            integer (kind=16) :: i, div, sd
            ! processing
            write (*,1000,advance='no') trim(write_to_string(n))//':'

            div = n
            do while (modulo(div, 2_16) .eq. 0)
                write (*,1000,advance='no') trim(write_to_string(2_16))
                div = div/2
            end do

            do while (modulo(div, 3_16) .eq. 0)
                write (*,1000,advance='no') trim(write_to_string(3_16))
                div = div/3
            end do

            i = 5
            do while (i*i .le. div)
                do while (modulo(div, i) .eq. 0)
                    div = div/i
                    write (*,1000,advance='no') trim(write_to_string(i))
                end do
                do while (modulo(div, i+2) .eq. 0)
                    div = div/(i+2)
                    write (*,1000,advance='no') trim(write_to_string(i))
                end do
                i = i+6
            end do

            if (div .gt. 2) then
                write (*,1000) trim(write_to_string(div))
            else
                write (*,*)
            end if

            1000 format (1X,A)
        end subroutine factorize
end module primes
