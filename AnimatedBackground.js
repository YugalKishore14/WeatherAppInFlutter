import React from 'react';
import './AnimatedBackground.css';

const AnimatedBackground = ({ condition }) => {
    // Map weather conditions to CSS classes
    const getBackgroundClass = (weatherCondition) => {
        if (weatherCondition.includes('clear')) return 'bg-clear';
        if (weatherCondition.includes('cloud')) return 'bg-clouds';
        if (weatherCondition.includes('rain') || weatherCondition.includes('drizzle')) return 'bg-rain';
        if (weatherCondition.includes('thunderstorm')) return 'bg-thunderstorm';
        if (weatherCondition.includes('snow')) return 'bg-snow';
        if (weatherCondition.includes('mist') || weatherCondition.includes('fog') || weatherCondition.includes('haze')) return 'bg-mist';
        return 'bg-default'; // Fallback
    };

    const backgroundClass = getBackgroundClass(condition);

    return (
        <div className={`animated-background ${backgroundClass}`}></div>
    );
};

export default AnimatedBackground;