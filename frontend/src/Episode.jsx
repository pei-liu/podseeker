import React from 'react';

const Episode = (props) => {
  return (
    <div className='episode-container'>
      <h3>{props.title}</h3>
      <p>Podcast: <a href={props.url} target="_blank" rel="noopener noreferrer">{props.podcast_title}</a></p>
      <p>Published: {props.publish_date}</p>
      <p>{props.description}</p>
    </div>
  );
};

export default Episode;
