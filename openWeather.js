// In a real application, you would typically store your API key in an environment variable.
// For a Create React App project, you can create a .env.local file in the root
// and add: REACT_APP_OPENWEATHER_API_KEY=YOUR_API_KEY
// Then access it via process.env.REACT_APP_OPENWEATHER_API_KEY

const API_KEY = process.env.REACT_APP_OPENWEATHER_API_KEY || 'YOUR_OPENWEATHER_API_KEY'; // Replace with your actual API key
const BASE_URL = 'https://api.openweathermap.org/data/2.5/weather';

export const fetchWeatherData = async (city) => {
    if (!API_KEY || API_KEY === 'YOUR_OPENWEATHER_API_KEY') {
        throw new Error('OpenWeather API key is missing. Please set it in .env.local or directly in openWeather.js');
    }

    const url = `${BASE_URL}?q=${city}&appid=${API_KEY}&units=metric`; // units=metric for Celsius
    const response = await fetch(url);

    if (!response.ok) {
        throw new Error(`HTTP error! status: ${response.status}`);
    }
    return await response.json();
};