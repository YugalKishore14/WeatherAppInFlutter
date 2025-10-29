import React from 'react';
import './WeatherCard.css';

const WeatherCard = ({ city, country, temperature, humidity, windSpeed, description, icon }) => {
    const iconUrl = `http://openweathermap.org/img/wn/${icon}@2x.png`;

    return (
        <div className="weather-card">
            <h2 className="city-name">{city}, {country}</h2>
            <div className="weather-main">
                <img src={iconUrl} alt={description} className="weather-icon" />
                <p className="temperature">{Math.round(temperature)}°C</p>
            </div>
            <p className="description">{description}</p>
            <div className="details-grid">
                <div className="detail-item">
                    <span className="detail-label">Humidity:</span>
                    <span className="detail-value">{humidity}%</span>
                </div>
                <div className="detail-item">
                    <span className="detail-label">Wind Speed:</span>
                    <span className="detail-value">{windSpeed} m/s</span>
                </div>
            </div>
        </div>
    );
};

export default WeatherCard;