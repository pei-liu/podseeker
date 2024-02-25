import React, { useState } from 'react';
import Episode from "./Episode";

const App = (props) => {
  const [searchTerm, setSearchTerm] = useState(props.search_term);
  const [userMsg, setUserMsg] = useState("Submit a search term to begin. Try 'tech'!");
  const [episodes, setEpisodes] = useState([]);

  const handleSearchTermChange = (e) => {
    setSearchTerm(e.target.value);
  }

  const handleSearch = async (e) => {
    e.preventDefault();

    if(searchTerm === undefined) {
      setUserMsg("Input can't be blank. Submit a search term to begin. Try 'tech'!");
      return;
    }

    try {
      const response = await fetch(`/search_episodes?q=${encodeURIComponent(searchTerm)}`);
      if (!response.ok) {
        throw new Error('Network response was not ok');
      }

      const data = await response.json();

      if(data.length === 0) {
        setUserMsg(`0 results for '${searchTerm}'. Try another search term.`);
      } else {
        setUserMsg('');
      }

      setEpisodes(data);
    } catch (error) {
      console.error('Error fetching search results:', error);
      setEpisodes([]);
    }
  }

  return (
    <div>
      <h1 id='logo'>PodSeeker</h1>
      <h3>Hello! Enter a keyword to search across many podcast series for episodes that match your interest.</h3>
      <form onSubmit={handleSearch} id='search-form'>
        <label htmlFor="name">
          Enter Keyword:
        </label>
        <input type="text" value={searchTerm} onChange={handleSearchTermChange} />
        <button type="submit">Search</button>
      </form>
      <hr />
      <p id="user-message">{userMsg}</p>
      <div id="episode-list-container">
        {
          episodes.map((ep) => (
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
