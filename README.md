## A basic app for viewing, slicing, and dicing FWS section 7 consultation data.

#### Release history

Version | DOI
------- | ----
v1.0    | [![DOI](https://zenodo.org/badge/20884/Defenders-ESC/section7_explorer.svg)](https://zenodo.org/badge/latestdoi/20884/Defenders-ESC/section7_explorer)

#### Summary

Section 7 of the US Endangered Species Act directs federal agencies to use their authority to help conserve listed species. One way they do this is by consulting with the US Fish and Wildlife Service (FWS) and National Marine Fisheries Service to ensure the agency's action won't jeopardize the continued existence of a species, or destroy the species critical habitat. Many myths surround section 7 consultations; we got data on all consultations recorded by FWS since 2008 and analyzed it. The results have been released in [Proceedings of the National Academy of Sciences](http://www.pnas.org/content/early/2015/12/01/1516938112), but because communicating results with broader audiences is a key component of improving policy implementation, we also made this [Shiny app](http://www.defenders.org/section7). We plan to update the data and the app on a regular basis and appreciate feedback that can improve either the code or the user experience.

#### Instructions

While the app is available at [shinyapps.io](https://defenders-esc.shinyapps.io/section7/), you may clone this repository and run the app locally.

1. `git clone git@github.com:Defenders-ESC/section7_explorer.git`
2. Open either `ui.R` or `server.R` in RStudio then choose `Run App` _or_ run `R` from a terminal and use `shiny::runApp()`
3. Explore.

#### Contributing

We welcome bug reports and feedback. If you find a bug then submit an issue [here](https://github.com/Defenders-ESC/section7_explorer/issues). 

If you want to propose a code change then submit a [pull request](https://github.com/Defenders-ESC/section7_explorer/pulls). In general, read through the code base and use the app a bit, so you understand how the bits-and-pieces are connected. Then, if you would like to suggest a change or update to the project, please follow these steps:

 - Open an issue to discuss your ideas with us.
 - Please limit each pull request to less than 500 lines.
 - Please encapsulate all new work in **short** functions (less than 50 lines each). We currently do not have unit tests for our functions (that will change!), but please include tests with the pull request.
 - Please ensure all tests (new and old) pass before signing off on your contribution.
 - Do something nice for yourself! You just contributed to this research, and we really appreciate you taking the time to check it out and get involved.

The most important step is the first one: open that issue to start a conversation, and we can offer help on any of the other points if you get stuck. 

#### Thanks

Thanks to [Bill Mills](https://github.com/BillMills) for the great Contributing suggestions and for the pointers on adding release information to this README.
