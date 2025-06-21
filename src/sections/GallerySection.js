import React from 'react';

const GallerySection = () => (
  <section className="p-10">
    <h2 className="text-2xl font-bold text-center mb-6">Campus Life & Events</h2>
    <div className="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 gap-4">
      <img src="https://via.placeholder.com/300x200" alt="event" className="rounded shadow" />
      <img src="https://via.placeholder.com/300x200" alt="event" className="rounded shadow" />
      <img src="https://via.placeholder.com/300x200" alt="event" className="rounded shadow" />
    </div>
  </section>
);

export default GallerySection;
