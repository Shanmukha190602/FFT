For increasing the speed of DFT computation , Fast Fourier Transform Algorithm is used. 

There are 2 types of FFT Algorithms:

-> Decimation in Time ( DIT ) FFT

-> Decimation in Frequency ( DIF ) FFT

Here verilog code is written for performing DIT FFT Radix 2 Algorithm

Typically Radix 2 DIT FFT algorithm is performed as shown in below pictre:


![Screenshot (28)](https://github.com/Shanmukha190602/FFT/assets/118514275/6b1edc1e-bb6d-4ec2-9f9e-bb4ae42043d1)


Generally while performing 8 point DIT FFT while solving the diagram looks as below:

![Screenshot (29)](https://github.com/Shanmukha190602/FFT/assets/118514275/79803304-c7dd-4ca6-a533-99ae0392bb6d)

Schematic Diagram of Butterfly in Verilog whose twiddle factors are W08 and W28 is shown below :

![Screenshot (30)](https://github.com/Shanmukha190602/FFT/assets/118514275/f5372365-fe65-4333-b613-419fac32172e)

Schematic Diagram of Butterfly in Verilog whose twiddle factors are W18 and W38 is shown below :

![Screenshot (31)](https://github.com/Shanmukha190602/FFT/assets/118514275/95a47b7d-f7fc-4a1c-8abc-671a145321a7)

Schematic Diagram of DIT FFT Radix 2 is shown below:

![Screenshot (32)](https://github.com/Shanmukha190602/FFT/assets/118514275/2d6877b2-f2c7-4f77-965d-be5d0d1f7273)

![Screenshot (24)](https://github.com/Shanmukha190602/FFT/assets/118514275/52c0b6a2-862c-4135-989a-ef3e65c6c2fd)

Simulation is shown below:

![Screenshot (25)](https://github.com/Shanmukha190602/FFT/assets/118514275/f177b3f0-5848-4fc2-85ce-f4bbf1001d5a)



