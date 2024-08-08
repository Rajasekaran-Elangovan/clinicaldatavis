# Clinical Data Visualization - Do It Yourself project

## Project Overview

This project aims to produce interactive static visualization outputs in the R window. The main objective is to explore the `tidyverse` package and `ggplot2` functionalities for creating clinical data visualizations. Data for this project can be completely sourced from `safetyData` & `formatters` package.

## Table of Contents
- [Project Overview](#project-overview)
- [Prerequisites](#prerequisites)
- [Installation](#installation)
- [Data Source](#data-source)
- [Usage](#usage)
- [Features](#features)
- [Contributing](#contributing)
- [License](#license)
- [Repository](#repository)

## Prerequisites

Before you begin, ensure you have met the following requirements:
- You have R installed on your machine.
- You have the following R packages installed:
  - `tidyverse`
  - `ggplot2`
  - `formatters`
  - `safetyData`

## Installation

To install the necessary packages, run the following commands in your R console:

```R
install.packages("tidyverse")
install.packages("ggplot2")
install.packages("formatters")
install.packages("safetyData")
```

## Data Source

The data for this project is sourced entirely from `safetyData` & `formatters` package. These packages provide a variety of Safety data that are standardized as per CDISC standards as per ADaM and SDTM standard. Also, `formatters` package have functions to format and manipulate data, making it suitable for clinical data visualization projects.

## Usage

To use this project, follow these steps:

1. Clone this repository to your local machine.
2. Open the project in RStudio or your preferred R environment.
3. Load the required libraries:

    ```R
    library(tidyverse)
    library(safetyData)
    library(ggplot2)
    library(formatters)
    ```

4. Source the scripts or run the code chunks provided to generate the visualizations.

## Features

- **Exploration of `tidyverse`**: Utilize the comprehensive collection of R packages designed for data science.
- **Advanced `ggplot2` Visualizations**: Create static but interactive visualizations tailored for clinical data.
- **Reproducible Analysis**: Scripts and functions provided can be easily reused and adapted for different datasets.
- **Data Sourcing from `safetyData` and `formatters`**: Leverage the `formatters` package for data manipulation and formatting also it provides simulated CDISC data for experimentation. `safetyData` package provides standardized clinical trial data sets and functions to facilitate the exploration and visualization of safety data. 

## Contributing

Contributions are welcome! To contribute, please follow these steps:

1. Fork the repository.
2. Create a new branch (`git checkout -b feature/YourFeature`).
3. Commit your changes (`git commit -m 'Add YourFeature'`).
4. Push to the branch (`git push origin feature/YourFeature`).
5. Create a pull request.

## License

This project is licensed under the MIT License. See the `LICENSE` file for more details.

## Repository
The project repository can be found at https://github.com/Rajasekaran-Elangovan/clinicaldatavis. @ @ #
