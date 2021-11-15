<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

  
        <header class="masthead">
            <div class="container px-4 px-lg-5 d-flex h-100 align-items-center justify-content-center">
                <div class="d-flex justify-content-center">
                    <form class="text-center row" name="login"  style="display:grid;" method="post" action="../Validar">
                        <h1 class="mx-auto my-0 text-uppercase">login</h1>
                        <input placeholder="usuario" name="usuario" id="u" class="p-2 m-2" required />
                         <input type="password"  placeholder="contraseña" name="passwd" id="c"  class="p-2 m-2" required />
              
                        <input type="submit" class="btn btn-primary m-2" value="Iniciar seccion"></input>
                    </form>
                </div>
            </div>
        </header>
       
       
    
   
