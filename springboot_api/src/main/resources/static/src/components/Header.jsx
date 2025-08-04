import { Link, useNavigate } from "react-router-dom";
import { useAuth } from "../hooks/useAuth";

function Header() {
  const { usuario, logout } = useAuth();
  const navigate = useNavigate();

  function handleLogout() {
    logout();
    navigate("/");
  }

  return (
    <header className="bg-sky-950 text-white px-4 p-6 h-18 shadow">
      <nav className="flex justify-between items-center max-w-6xl mx-auto">
        <Link to="/">
          <img
            src="./public/logo.png"
            alt="Logo BluCidadão"
            className="h-13 -mt-3 cursor-pointer"
          />
        </Link>

        <ul className="flex items-center space-x-8 font-light">
          <li>
            <Link to="/noticias" className="hover:underline">
              Notícias
            </Link>
          </li>
          <li>
            <Link to="/servicos" className="hover:underline">
              Serviços
            </Link>
          </li>
          <li>
            <Link to="/ajuda" className="hover:underline">
              Ajuda
            </Link>
          </li>

          {usuario ? (
            <>
              <li>
                <Link to="/dashboard" className="hover:underline">
                  Dashboard
                </Link>
              </li>
              <li>
                <Link to="/perfil" className="hover:underline">
                  Perfil
                </Link>
              </li>
              <li>
                <button
                  onClick={handleLogout}
                  className="bg-white text-blue-800 px-3 py-1 rounded hover:bg-gray-100"
                >
                  Sair
                </button>
              </li>
            </>
          ) : (
            <>
              <li>
                <Link to="/login" className="hover:underline">
                  Login
                </Link>
              </li>
              <li>
                <Link to="/cadastro" className="hover:underline">
                  Cadastro
                </Link>
              </li>
            </>
          )}
        </ul>
      </nav>
    </header>
  );
}

export default Header;