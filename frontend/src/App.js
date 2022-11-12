import "./App.css";
import {BrowserRouter as Router, Routes, Route} from 'react-router-dom';


import Home from './pages/Home';
import AddSupplier from './pages/AddSupplier';
import Addproduct from './pages/Addproduct';
import ViewProduct from './pages/ViewProducts';

import Navbar from './Components/Navbar';

function App() {
  return (
   <Router>
    <Navbar/>
    <Routes>
    <Route path='/home' element={<Home/>} />
    <Route path='/addsupplier' element={<AddSupplier/>} />
    <Route path='/addproduct' element={<Addproduct/>} />
    <Route path='/viewproduct' element={<ViewProduct/>} />
    </Routes>
   </Router>

  );
}

export default App;
