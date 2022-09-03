! pseudo-random nos. generation
module rand128
    implicit none
    integer (kind=16) :: seed = 0
    contains
        ! 64-bit Linear Congruential Generator.
        function random_integer() result(rnd)
            ! function result location
            integer (kind=16) :: rnd
            real :: r
            ! processing
            call random_number(r)
            if (seed .eq. 0) seed = r*(2**31-1)
            seed = mod(2862933555777941757_16*seed+3037000493_16, 2_16**64)
            rnd = seed
        end function random_integer
end module rand128
