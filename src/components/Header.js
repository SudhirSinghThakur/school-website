import React from 'react';
import { Link } from 'react-router-dom';

const Header = () => (
  <header className="bg-white shadow-md p-4 flex justify-between items-center">
    <div className="text-xl font-bold text-blue-700">DVPS</div>
    <nav className="space-x-4">
      <Link to="/" className="text-gray-700 hover:text-blue-600">Home</Link>
      <Link to="/about" className="text-gray-700 hover:text-blue-600">About</Link>
      <Link to="/contact" className="text-gray-700 hover:text-blue-600">Contact</Link>
    </nav>
  </header>
);

export default Header;
