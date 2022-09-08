FC = gfortran
FCFLAGS = -std=f95 -pedantic -Werror -O2
FLFLAGS = -static -s

driver: driver.o primes.o prng.o
	$(FC) -o $@ $^ $(FLFLAGS)

driver.o: driver.f90 primes.o prng.o
	$(FC) -c $< $(FCFLAGS)

primes.o: primes.f90
	$(FC) -c $< $(FCFLAGS)

prng.o: prng.f90
	$(FC) -c $< $(FCFLAGS)

.PHONY: clean
clean:
	$(RM) driver *.o *.mod *~
