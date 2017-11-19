# LOESS fitting package

This is a package for Mathematica for LOESS fitting.

All credit to the particular implementation goes to Stack Exchange user [Rahul][rahul] as it is a slightly modified version of the code for (x,y) pairs data instead of (x,y,z) data.  The order of the fitting function can also be selected, though traditionally LOESS fitting is order 1 or 2.

## Usage

The function `Loess` provides a fitting function that can be mapped to the data.  

`Loess[{{x1,y1},..}, k, order:2]`
: constructs a fitting function of function values *yi* corresponding to *x* values *xi* using *k* neighbors.  Optional *order* parameter should be set to *1* for linear fits or *2* for quadratic fits (default).

This fitting function can than be applied to the original *x* values to provide the fitted *y* values.

    data = Transpose[{x,y}]
    loessfit = Loess[data, 20, 2];
    loessdata = Transpose[{x, loessfit /@ x}];

For a detailed example, see the included Mathematica notebook `loess-example.nb`.

## Links

For more information on LOESS fitting, see:

- [Local regression][wiki]
- [*Visualizing Data* by William S. Cleveland][amazon]
- [original Stack Exchange post][se]

[wiki]: https://en.wikipedia.org/wiki/Local_regression
[amazon]: https://www.amazon.com/Visualizing-Data-William-S-Cleveland/dp/0963488406
[rahul]: https://mathematica.stackexchange.com/users/484/rahul
[se]: https://mathematica.stackexchange.com/questions/45519/smoothing-listcontourplot-contours/45524#45524
