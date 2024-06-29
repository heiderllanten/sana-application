"use client";

import Link from 'next/link';
import Image from 'next/image'
import * as React from 'react';
import { useState, useEffect } from 'react';
import styles from './shopping-cart.module.css';
import { Circles } from 'react-loader-spinner';
import { useRouter } from 'next/navigation'

const ShoppingCart = () => {
  const [cart, setCart] = useState([]);
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState(null);
  const router = useRouter();

  useEffect(() => {
    const storedCart = localStorage.getItem('cart');
    if (storedCart) {
      setCart(JSON.parse(storedCart));
    }
  }, []);

  const getTotalPrice = () => {
    return Object.values(cart).reduce((total: number, item: any) => total + item.price * item.quantity, 0);
  };

  const getTotalProducts = () => {
    return Object.values(cart).reduce((total: number, item: any) => total + item.quantity, 0);
  };

  const processOrder = async () => {
    if(Object.values(cart).length == 0){
      alert("No products to process.");
      return;
    }    

    try {
      setLoading(true);

      var orderDetails = Object.values(cart).map((orderDetail: any) => 
        (
          {
            productId: orderDetail.id,
            price: orderDetail.price,
            quantity: orderDetail.quantity
          }
        )
      );

      console.log(orderDetails);

      var response = await fetch('https://localhost:7192/api/Order', {
        method: 'POST',
        headers: {
          "Content-Type": "application/json; charset=utf-8"
        },
        body: JSON.stringify({
          customerId: 1,
          orderDetails: orderDetails
        }),
      });

      alert("Order created successfully!");
      router.push('/catalog');
    } catch (error: any) {
      setError(error);
    } finally {
      setLoading(false);
    }
  }

  if (loading) {
    return <div className={styles.spinner}>
        <Circles
          height="80"
          width="80"
          color="green"
          ariaLabel="loading"
        />
      </div>
  }

  if (error) {
    return <p>Error: {error}</p>;
  }

  return (
    <div className={styles.container}>
      <div className={styles.cartListContainer}>
        <h1><b>My Shopping Cart</b></h1>
        <div className={styles.cartListItem}>
          <div className={styles.productInfoColumn}>
            <p>Product</p>
          </div>
          <p>Price</p>
          <p>Quantity</p>
          <p>Total</p>
        </div>
        <hr></hr>
        {Object.values(cart).map((product: any) => (
          <div className={styles.cartListItem}>
            <div className={styles.productInfoColumn}>
              <Image
                  src="/motosierra.jpg"
                  width={80}              
                  height={80}
                  alt="Picture of the author"
                />
              <div>
                <h2><b>{product.name}</b></h2>
                <p>Item No: {product.code}</p>
                <p>{product.description}</p>
              </div>
            </div>
            <p>{product.price.toFixed(2)}</p>
            <input type='button' disabled value={product.quantity}></input>
            <p>{(product.price * product.quantity).toFixed(2)}</p>
          </div>
        ))}        
        <Link href="/catalog"><div className="backLink">Go to Catalog</div></Link>
      </div>
      <div>
        <h1><b>Shopping Cart Details</b></h1>
        <p className={styles.totalPrice}>Items ({getTotalProducts()} items) ${getTotalPrice().toFixed(2)}</p>
        <p className={styles.totalPrice}>Total Price: ${getTotalPrice().toFixed(2)}</p>
        <button className={"addButton " + styles.button} onClick={() => processOrder()}>Process Order</button>        
      </div>
    </div>
  );
};

export default ShoppingCart;

