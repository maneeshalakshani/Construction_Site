import React, { useState } from 'react'
import * as FaIcons from "react-icons/fa";
import {Link} from 'react-router-dom';
import {SidebarData} from './SidebarData';
import '../CSS/Navbar.css';



function Navbar() {
    const [sidebar,setSidebar]= useState(false);
    const showSidebar = ()=> setSidebar(!sidebar);

  return (
    <div>
     
      <div className='navbar'>
        <Link to="#" className='menubars'>
        </Link>
      </div>
      <nav className={sidebar ? 'nav-menu active': 'nav-menu'}>
        <ul className='nav-menu-items'>
            <li className='navbar-toggle'>
                <h1 className='topic'>Sky Light Construction</h1>
            </li>
            {SidebarData.map((item, index)=>{ 
                return( 
                  <div>
                    <li key={index} className={item.cName}>
                        <Link to={item.path}>
                            {item.icon}
                            <span>{item.title}</span>
                        </Link>
                    </ li>
                    </div>
                );
            })}
        </ul>
        
      </nav>
     
    </div>
  )
}

export default Navbar
