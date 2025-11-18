// Converted to variables-only mode: no methods block needed

rule fifthFibonacciElementIsFive {
    assert fibonacci(5) == 5;
}

rule fibonacciMonotonicallyIncreasing {
    uint32 i1;
    uint32 i2;

    assert i2 > i1 => fibonacci(i2) >= fibonacci(i1);
}