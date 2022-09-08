! pseudo-random nos. generation
module prng
    implicit none
    integer (kind=16) :: seed = 0
    contains
        ! dispatch function
        function rnd(nobits) result(z)
            ! dummy argument
            integer, intent(in) :: nobits
            ! function result location
            integer (kind=16) :: z
            ! processing
            if (nobits .eq. 16) then
                seed = modulo(16411_16*seed+12345_16, 2_16**16)
            else if (nobits .eq. 32) then
                seed = modulo(1073741833_16*seed+123456789_16, 2_16**32)
            else if (nobits .eq. 48) then
                seed = modulo(44485709377909_16*seed+11863279_16, 2_16**48)
            else if (nobits .eq. 64) then
                seed = modulo(2862933555777941757_16*seed+3037000493_16, 2_16**64)
            else
                seed = modulo(2862933555777941757_16*seed+3037000493_16, 2_16**80)
                !seed = modulo(2862933555777941757_16*seed+3037000493_16,&
                !     170141183460469231731687303715884105727_16)
            end if
            z = seed
        end function rnd
end module prng
