import React, { useEffect } from 'react';

import axios from 'axios';

import '../CSS/view_all_suppliers_css.css';

function ChangeOrderStatus() {

    const [orders, setOrders] = React.useState(null);
    const [item, setItems] = React.useState(null);

    const [reason, setReason] = React.useState(null);

    React.useEffect(() => {
        getPendingOrders();
      }, []);

    function getPendingOrders(){
        axios.get('http://localhost:8002/order/getAllPendingOrders').then((response) => {
            setOrders(response.data.Result);
        });
    }  

    function getItem(id){
        axios.get(`http://localhost:8002/item/get/${id}`).then((res) => {
            setItems(res.data.Result);
        });
    }

  function rejectOrder(id) {
    axios.put(`http://localhost:8002/order/update/${id}`, {
        orderStatus: 'Rejected',
        reason: reason
    })
      .then((response) => {
        setReason(null);
        getPendingOrders();
      });
  }

  function acceptOrder(id) {
    axios.put(`http://localhost:8002/order/update/${id}`, {
        orderStatus: 'Accepted',
    })
      .then((response) => {
        getPendingOrders();
      });
  }

    if(orders == null){
        <div className='row'>
            <div className='col container view_all_suppliers_container'>
                <table class="table">
                    <thead class="thead-dark">
                        <tr>
                            <th scope="col">Product ID</th>
                                <th scope="col">Quantity</th>
                                <th scope="col">Order Total</th>
                                <th scope="col">Reject Reason</th>
                                <th scope="col">Accept</th>
                                <th scope="col">Reject</th>
                        </tr>
                    </thead>
                    <tbody>
                        No Data
                    </tbody>
                </table>
            </div>
            <div className='col'></div>
        </div>
    }else{
        return(
            <div className='row'>
                <div className='col view_all_suppliers_container'>
                    <table class="table">
                        <thead class="thead-dark">
                            <tr>
                                <th>Product ID</th>
                                <th>Quantity</th>
                                <th>Order Total</th>
                                <th>Reject Reason</th>
                                <th>Accept</th>
                                <th>Reject</th>
                            </tr>
                        </thead>
                        <tbody>
                            {
                                orders.map((pro, index) => {
                                    getItem(pro._id);
                                    return(
                                        <tr key={index}>
                                            <td>{pro.itemID}</td>
                                            <td>{pro.quantity}</td>
                                            <td>{pro.totPrice}</td>
                                            <input type="text" id="fname" name="firstname" placeholder="Your Reason.." onChange={e => {setReason(e.target.value);}}></input>
                                            <td>
                                                <button className='btn btn-danger' onClick={() => rejectOrder(pro._id)}>Reject</button>
                                            </td>
                                            <td>
                                                <button className='btn btn-success' onClick={() => acceptOrder(pro._id)}>Accept</button>
                                            </td>
                                        </tr>
                                    )
                                  })
                            }
                        </tbody>
                    </table>
                </div>
                <div className='col'></div>
            </div>
        )
    }
}

export default ChangeOrderStatus;