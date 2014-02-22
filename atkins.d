import std.stdio;
import std.math;
import std.conv;

bool contains(int target,int[] array){
    writeln(target);
    if({foreach(i;array) if(i==target) return true; return false;}())
        return true;
    else
        return false;
}

void main()
{

    auto max = 100000000L;
    auto PrimeI = 1;
    auto sqrt_max = cast(int) sqrt(cast(float)max) + 1;
    int[] sequence = [ 2, 4 ];
    bool[] array = new bool[max];
    int index = 0;
    int k1 = 0;
    int k = 0;
    int x = 1;
    int y = 0;

    double xUpper = sqrt(max / 4.0) + 1;    

    while (x < xUpper) {
        index = 0;
        k1 = 4 * x * x;
        y = 1;
        if (x % 3 == 0) {
            while (true) {
                k = k1 + y * y;
                if (k >= max) {
                    break;
                }
                array[k] = !array[k];
                y += sequence[(++index & 1)];
            }
        } else {
            while (true) {
                k = k1 + y * y;
                if (k >= max) {
                    break;
                }
                array[k] = !array[k];
                y += 2;
            }
        }
        x++;
    }
    xUpper = sqrt(max / 3.0) + 1;
    x = 1;
    y = 0;

    while (x < xUpper) {
        index = 1;
        k1 = 3 * x * x;
        y = 2;
        while (true) {
            k = k1 + y * y;
            if (k >= max) {
                break;
            }
            array[k] = !array[k];
            y += sequence[(++index & 1)];
        }
        x += 2;
    }


    auto fuckMeRightQ = cast(double) max;
    xUpper = cast(int) sqrt(fuckMeRightQ);
    x = 1;
    y = 0;

    while (x < xUpper) {
        k1 = 3 * x * x;
        if ((x & 1) == 0) {
            y = 1;
            index = 0;
        } else {
            y = 2;
            index = 1;
        }
        while (y < x) {
            k = k1 - y * y;
            if (k < max) {
                array[k] = !array[k];
            }
            y += sequence[(++index & 1)];
        }
        x++;
    }

    array[2] = true;
    array[3] = true;
    foreach (n; 5 .. sqrt_max) {
        if (array[n]) {
            int n2 = n * n;
            for (k = n2; k < max; k += n2) {
                array[k] = false;
            }
        }
    }

    // Display prime
    long pi = 0;
    foreach (i;2 .. max) {
        if (array[i]) {
            pi++;
            writeln(i);
        }
    }
}
