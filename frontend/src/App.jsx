import React, { useState } from 'react';
import Episode from "./Episode";
// import style from './Home.module.css';

const App = (props) => {
  const [searchTerm, setSearchTerm] = useState(props.search_term);
  const [episodes, setEpisodes] = useState([]);

  const handleSearchTermChange = (e) => {
    setSearchTerm(e.target.value);
  }

  const handleSearch = async (e) => {
    e.preventDefault();

    try {
      const response = await fetch(`/search_episodes?q=${encodeURIComponent(searchTerm)}`);
      if (!response.ok) {
        throw new Error('Network response was not ok');
      }
      const data = await response.json();

      setEpisodes(data);
    } catch (error) {
      console.error('Error fetching search results:', error);
      setEpisodes([]);
    }
  }

  return (
    <div>
      <h3>Hello! Enter a keyword to search across many podcast series for episodes that match your interest.</h3>
      <hr />
      <form onSubmit={handleSearch}>
        <label htmlFor="name">
          Enter Keyword:
          <input id="name" type="text" value={searchTerm} onChange={handleSearchTermChange} />
        </label>
        <button type="submit">Search</button>
      </form>
      <div id="episode-list-container">
        {
          episodes.map((ep, index) => (
            <Episode
              podcast_title={ep.podcast_title}
              podcast_image_url={ep.podcast_image_url}
              title={ep.episode_title}
              description={ep.episode_description}
              url={ep.episode_url}
              publish_date={ep.episode_publish_date}
            />
          ))
        }
      </div>
    </div>
  );
};

export default App;
