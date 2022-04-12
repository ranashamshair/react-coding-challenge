import React from "react"
import Table from "./Table";

class Dashboard extends React.Component {
  render () {
    return (
      <React.Fragment>
        <div className="max-w-7xl mx-auto px-4 sm:px-6 mt-4">
          <Table />
        </div>
      </React.Fragment>
    );
  }
}

export default Dashboard;
