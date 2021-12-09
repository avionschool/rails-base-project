// import React from "react"
// import PropTypes from "prop-types"
// class HelloWorld extends React.Component {
//   render () {
//     return (
//       <React.Fragment>
//         Greeting: {this.props.greeting}
//       </React.Fragment>
//     );
//   }
// }

// HelloWorld.propTypes = {
//   greeting: PropTypes.string
// };
// export default HelloWorld

import React from 'react'

function HelloWorld({greeting}) {
  return (
    <div>
      <>
        Greeting: {greeting}
      </>
    </div>
  )
}

export default HelloWorld
