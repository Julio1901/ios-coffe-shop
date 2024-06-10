#  iOS Coffee Shop Project

This is a native iOS project developed in Swift. The objective of the project is to build an entire app using ViewCode and demonstrate the application of some design patterns within an MVVM architecture.

## Status

🚧 **Under Construction** 🚧

## Motivation

The motivation behind this project is to illustrate the implementation of the MVVM architecture and the use of ViewCode in iOS development. By doing so, the project aims to showcase how to structure an iOS app to enhance separation of concerns, improve maintainability, and facilitate testing.

## Architecture and Design Patterns

- MVVM (Model-View-ViewModel): The app is structured using the MVVM architecture, which helps in separating the UI (View), business logic (ViewModel), and data management (Model).
- Hierarchical MVVM: Uses parent and child ViewModels to better organize and manage the state of the app, enhancing reusability and separation of concerns.
- ViewCode: All UI components are built programmatically without using Storyboards or XIB files.
- Repository Pattern: Manages data operations and abstracts the data sources from the ViewModels.
- Delegate Pattern: Facilitates communication between objects by allowing one object to act on behalf of, or in coordination with, another object.

## Tests
The project includes tests to ensure the reliability and correctness of the implemented features. The tests are implemented using XCTest, Apple's framework for unit testing.

- Unit Tests with XCTest: Tests cover the core functionalities and business logic within the ViewModels and Models to ensure they work as expected.
- UI Tests: (To be added) Tests will cover the user interface to ensure the app behaves correctly from the user's perspective.
- Snapshot Tests: (To be added) Tests will capture and compare visual snapshots of the UI to ensure it renders correctly.



## Warning

⚠️ The loading of the coffee list depends on three distinct services, which unfortunately makes the loading process slow. However, since the app relies on free API services, there's nothing that can be done to improve this.

## Demo

![Project Demo](https://raw.githubusercontent.com/Julio1901/myProjectsImages/master/ios-coffee-shop/coffee-shop-01.png)
![Project Demo](https://raw.githubusercontent.com/Julio1901/myProjectsImages/master/ios-coffee-shop/coffee-shop-02.png)
![Project Demo](https://raw.githubusercontent.com/Julio1901/myProjectsImages/master/ios-coffee-shop/coffee-shop-03.png)
![Project Demo](https://raw.githubusercontent.com/Julio1901/myProjectsImages/master/ios-coffee-shop/coffee-shop-04.png)



## How to Run the Project

To run the project on your local environment, follow the instructions below:

1. Clone this repository on your local machine:

   ```bash
   git clone https://github.com/your_username/your_repository.git

2. Open the ProjectName.xcodeproj file in Xcode.

3. Before building the project, create an API key at NewsAPI and follow the instructions in the ConstantsExample file to set up your API key.

4. Select the desired device or simulator and click on the run button.

5. Explore the app to see the implementation of the MVVM architecture with ViewCode.

## License

This project is licensed under the [MIT License](https://opensource.org/licenses/MIT).
