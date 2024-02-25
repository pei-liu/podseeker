import React, { useState, useEffect } from 'react';

const HealthCheck = (props) => {

  const [message, setMessage] = useState('Getting Status...');

  useEffect(() => {
    const fetchHealthStatus = async () => {
      const response = await fetch('/health');

      if(response.ok) {
        setMessage(`${response.status} ok`);
      } else {
        setMessage(`${response.status} not ok`);
      }
    }

    // call the function
    fetchHealthStatus()
      // make sure to catch any error
      .catch((error) => {
        console.log(error)
        setMessage('Error: see console output')
      });;
  }, [])

  return (
    <div id='health-check'>
      {message}
    </div>
  );
};

export default HealthCheck;
