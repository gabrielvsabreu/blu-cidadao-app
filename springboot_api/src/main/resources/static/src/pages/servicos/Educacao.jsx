function Educacao() {
  return (
    <div className="p-6 max-w-2xl mx-auto">
      <h2 className="text-2xl font-bold text-sky-950 mb-4">Boletim Escolar</h2>
      <table className="w-full table-auto border border-gray-300 text-left">
        <thead className="bg-gray-100">
          <tr>
            <th className="p-2 border">Disciplina</th>
            <th className="p-2 border">Nota</th>
          </tr>
        </thead>
        <tbody>
          <tr><td className="p-2 border">Matemática</td><td className="p-2 border">9.0</td></tr>
          <tr><td className="p-2 border">Português</td><td className="p-2 border">8.5</td></tr>
          <tr><td className="p-2 border">História</td><td className="p-2 border">7.5</td></tr>
        </tbody>
      </table>
    </div>
  );
}

export default Educacao;
import React from 'react';