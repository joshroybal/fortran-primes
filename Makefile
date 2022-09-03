FC = gfortran
FCFLAGS = -std=f95 -pedantic -Werror -O2
FLFLAGS = -static -s
RM = del

driver.exe: driver.o primes.o rand128.o
	$(FC) -o $@ $^ $(FLFLAGS)

driver.o: driver.f90 primes.o rand128.o
	$(FC) -c $< $(FCFLAGS)

primes.o: primes.f90
	$(FC) -c $< $(FCFLAGS)

rand128.o: rand128.f90
	$(FC) -c $< $(FCFLAGS)

.PHONY: clean
clean:
	$(RM) *.exe *.o *.mod *~
