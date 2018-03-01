<h1>Bike Incident</h1>

<h3>Overview</h3>

Bike Incident is a reporting tool that allows only registered users gain access to bike incident reports

<h3>Getting Started</h3>

Visit the Bike Incident <a href="https://app.apiary.io/bikeincident/">API Documentation</a>. It is clearly written and easy to understand and use. Unfortunately, this was done using a free apiary account and demands you to login


<h3>External Dependencies</h3>

All the dependencies can be found in the <a href="https://github.com/nwochaadim/bike_incident/blob/master/Gemfile">Gemfile.</a>

<h3> Versions</h3>
Bike Incident API currently has only one version and can be accessed via this link - <a href="https://bike-incident.herokuapp.com/api/v1/">https://bike-incident.herokuapp.com/api/v1</a>



<h3>Running Test</h3>
The Bike Incident API uses `rspec` for testing. Continuous Integration is carried out via Circle CI.

To test locally, go through the following steps.

1. Clone the repo to your local machine.

  ```bash
  $  git clone https://github.com/nwochaadim/bike_incident.git
  ```

2. `cd` into the `bike_incident` folder.

  ```bash
  $  cd bike_incident
  ```

3. Run bin/setup and voila!, you setup!

  ```bash
  $  bin/setup
  ```

5. Run the tests.

  ```bash
  $  bundle exec rspec
  ```
