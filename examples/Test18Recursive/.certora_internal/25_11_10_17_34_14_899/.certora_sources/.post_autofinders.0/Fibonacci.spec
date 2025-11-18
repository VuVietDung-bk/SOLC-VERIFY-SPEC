methods {
    function fibonacci(uint32) external returns (uint32) envfree;
}

rule fifthFibonacciElementIsFive {
    assert fibonacci(5) == 5;
}

rule fibonacciMonotonicallyIncreasing {
    uint32 i1;
    uint32 i2;

    assert i2 > i1 => fibonacci(i2) >= fibonacci(i1);
}