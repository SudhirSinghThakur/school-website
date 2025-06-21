import React from 'react';

const FeaturesSection = () => (
  <section className="p-10 bg-gray-100 grid grid-cols-1 md:grid-cols-3 gap-6">
    <div className="bg-white shadow-md p-6 rounded-lg">
      <h3 className="text-xl font-bold mb-2">Experienced Faculty</h3>
      <p>Our staff consists of highly qualified and passionate educators.</p>
    </div>
    <div className="bg-white shadow-md p-6 rounded-lg">
      <h3 className="text-xl font-bold mb-2">Modern Infrastructure</h3>
      <p>State-of-the-art facilities for classrooms, labs, and sports.</p>
    </div>
    <div className="bg-white shadow-md p-6 rounded-lg">
      <h3 className="text-xl font-bold mb-2">Holistic Development</h3>
      <p>Focus on both academics and extracurriculars for well-rounded growth.</p>
    </div>
  </section>
);

export default FeaturesSection;
