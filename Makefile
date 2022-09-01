FC = gfortran
FCFLAGS = -std=f95 -pedantic -Werror -O2
FLFLAGS = -static -s
RM = del

driver.exe: driver.o primes.o random_digits.o
	$(FC) -o $@ $^ $(FLFLAGS)

driver.o: driver.f90 primes.o
	$(FC) -c $< $(FCFLAGS)

primes.o: primes.f90
	$(FC) -c $< $(FCFLAGS)

random_digits.o: random_digits.f90
	$(FC) -c $< $(FCFLAGS)

.PHONY: clean
clean:
	$(RM) driver *.o *.mod *~
