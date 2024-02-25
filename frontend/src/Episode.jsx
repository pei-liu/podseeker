import React from 'react';

const Episode = (props) => {
  return (
    <div className='episode-container'>
      <h3>{props.title}</h3>
      <p>{props.description}</p>
    </div>
  );
};

export default Episode;
