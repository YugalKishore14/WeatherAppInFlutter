import React, { useState, useEffect, useCallback } from 'react';
import './App.css';
import { fetchWeatherData } from './api/openWeather';
import WeatherCard from './components/WeatherCard';
import AnimatedBackground from './components/AnimatedBackground';

function App() {
    const [city, setCity] = useState('');
    const [weatherData, setWeatherData] = useState(null);
    const [loading, setLoading] = useState(false);
    const [error, setError] = useState('');

    // Default city for initial load or if user doesn't input
    const defaultCity = 'London';

    const getWeather = useCallback(async (cityName) => {
        if (!cityName) {
            setError('Please enter a city name.');
            return;
        }
        setLoading(true);
        setError('');
        try {
            const data = await fetchWeatherData(cityName);
            setWeatherData(data);
        } catch (err) {
            console.error("Error fetching weather data:", err);
            setError('Could not fetch weather data. Please check the city name or try again later.');
            setWeatherData(null); // Clear previous data on error
        } finally {
            setLoading(false);
        }
    }, []);

    // Fetch weather for default city on initial load
    useEffect(() => {
        getWeather(defaultCity);
    }, [getWeather, defaultCity]);

    const handleSearch = (e) => {
        e.preventDefault();
        getWeather(city);
    };

    // Determine weather condition for background
    const weatherCondition = weatherData?.weather?.[0]?.main.toLowerCase() || 'clear';

    return (
        <div className="App">
            <AnimatedBackground condition={weatherCondition} />
            <div className="weather-container">
                <h1>Weather Dashboard</h1>
                <form onSubmit={handleSearch} className="search-form">
                    <input
                        type="text"
                        placeholder="Enter city name"
                        value={city}
                        onChange={(e) => setCity(e.target.value)}
                        className="city-input"
                    />
                    <button type="submit" className="search-button" disabled={loading}>
                        {loading ? 'Searching...' : 'Search'}
                    </button>
                </form>

                {error && <p className="error-message">{error}</p>}

                {weatherData && !loading && (
                    <WeatherCard
                        city={weatherData.name}
                        country={weatherData.sys.country}
                        temperature={weatherData.main.temp}
                        humidity={weatherData.main.humidity}
                        windSpeed={weatherData.wind.speed}
                        description={weatherData.weather[0].description}
                        icon={weatherData.weather[0].icon}
                    />
                )}

                {!weatherData && !loading && !error && (
                    <p className="no-data-message">Enter a city to see the weather!</p>
                )}
            </div>
        </div>
    );
}

export default App;