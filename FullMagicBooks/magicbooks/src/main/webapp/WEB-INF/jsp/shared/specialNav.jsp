<%@ taglib prefix="button" uri="http://www.springframework.org/tags/form" %>
<ul id='sort' class='dropdown-content'>
    <li><a href="${pageContext.request.contextPath}/home/magicbooks/sortLowToHigh?search=${value}">Price:Low to High</a>
    </li>
    <li class="divider" tabindex="-1"></li>
    <li><a href="${pageContext.request.contextPath}/home/magicbooks/sortHighToLow?search=${value}">Price:High to Low</a>
    </li>
    <li class="divider" tabindex="-1"></li>
    <li><a href="${pageContext.request.contextPath}/home/magicbooks/sortByRating?search=${value}">Rating</a></li>


</ul>
<ul id='sortMobile' class='dropdown-content'>
    <li><a href="${pageContext.request.contextPath}/home/magicbooks/sortLowToHigh?search=${value}">Price:Low to High</a>
    </li>
    <li class="divider" tabindex="-1"></li>
    <li><a href="${pageContext.request.contextPath}/home/magicbooks/sortHighToLow?search=${value}">Price:High to Low</a>
    </li>
    <li class="divider" tabindex="-1"></li>
    <li><a href="${pageContext.request.contextPath}/home/magicbooks/sortByRating?search=${value}">Rating</a></li>

</ul>
<!-- Modal Structure -->
<div id="filterModalMobile" class="modal blue lighten-5">
    <a href="#" onclick="return false;" class="modal-close"> <i class="material-icons right">close</i></a>
    <div class="modal-content">
        <form:form modelAttribute="filterBooks" action="${pageContext.request.contextPath}/home/magicbooks/filter"
                   method="post" class="col s12">
            <center>
                <p>
                    <form:button class=" btn-floating btn-small  waves-effect waves-dark" type="submit" name="action">
                        <i class="material-icons right">filter_list</i>
                    </form:button>
                    <button class="btn-floating btn-small red waves-effect waves-dark" type="reset" name="action">

                        <i class="material-icons right">cancel</i>
                    </button>
                    <form:input type="hidden" path="value" value="${value}"/>
                </p>
            </center>
            <div class="row" style="font-size:12px;">
                <div class="col s6">
                    <div class="row">

                        <div class="col s12">By Category:</div>
                    </div>
                    <div class="row">
                        <div class="col s12"><label>
                            <form:checkbox path="categoryList" value="Fiction"/>
                            <span>Fiction</span>
                        </label></div>
                    </div>
                    <div class="row">
                        <div class="col s12"><label>
                            <form:checkbox path="categoryList" value="Non_Fiction"/>
                            <span>Non - Fiction</span>
                        </label></div>
                    </div>
                    <div class="row">
                        <div class="col s12"><label>
                            <form:checkbox path="categoryList" value="Education"/>
                            <span>Educational</span>
                        </label></div>
                    </div>
                    <div class="row">
                        <div class="col s12"><label>
                            <form:checkbox path="categoryList" value="Children"/>
                            <span>Children</span>
                        </label></div>
                    </div>
                    <div class="row">
                        <div class="col s12"><label>
                            <form:checkbox path="categoryList" value="other"/>
                            <span>Other</span>
                        </label></div>
                    </div>
                </div>
                <div class="col s6">
                    <div class="row">
                        <div class="col s12">By Rating:</div>
                    </div>
                    <div class="row">
                        <div class="col s12"><label>
                            <form:checkbox path="ratingList" value="5"/>
                            <span> <i class="material-icons right mobile yellow-text ">grade</i><i
                                    class="material-icons right mobile yellow-text">grade</i>
                        <i class="material-icons right mobile yellow-text">grade</i><i
                                        class="material-icons right  mobile yellow-text">grade</i>
                        <i class="material-icons right mobile yellow-text">grade</i></span>
                        </label></div>
                    </div>
                    <div class="row">
                        <div class="col s12"><label>
                            <form:checkbox path="ratingList" value="4"/>
                            <span><i class="material-icons right mobile yellow-text">grade</i><i
                                    class="material-icons right mobile yellow-text">grade</i>
                        <i class="material-icons right mobile yellow-text">grade</i><i
                                        class="material-icons right mobile yellow-text">grade</i></span>
                        </label></div>
                    </div>
                    <div class="row">
                        <div class="col s12"><label>
                            <form:checkbox path="ratingList" value="3"/>
                            <span><i class="material-icons right mobile yellow-text">grade</i><i
                                    class="material-icons right mobile yellow-text">grade</i>
                        <i class="material-icons right mobile yellow-text">grade</i></span>
                        </label></div>
                    </div>
                    <div class="row">
                        <div class="col s12"><label>
                            <form:checkbox path="ratingList" value="2"/>
                            <span><i class="material-icons right mobile yellow-text">grade</i><i
                                    class="material-icons right mobile yellow-text">grade</i>
                       </span>
                        </label></div>
                    </div>
                    <div class="row">
                        <div class="col s12"><label>
                            <form:checkbox path="ratingList" value="1"/>
                            <span><i class="material-icons right mobile yellow-text">grade</i>
                       </span>
                        </label></div>
                    </div>
                </div>
            </div>

        </form:form>
    </div>
</div>

<!-- Modal Structure -->
<div id="filterModal" class="modal  bottom-sheet blue lighten-5">
    <a href="#" onclick="return false;" class="modal-close"> <i class="material-icons right">close</i></a>
    <div class="modal-content">
        <form:form modelAttribute="filterBooks" action="${pageContext.request.contextPath}/home/magicbooks/filter"
                   method="post" class="col s12">
            <center>
                <p>
                    <form:button class=" btn-floating btn-small  waves-effect waves-dark" type="submit" name="action">
                        <i class="material-icons right">filter_list</i>
                    </form:button>
                    <button class="btn-floating btn-small red waves-effect waves-dark" type="reset" name="action">

                        <i class="material-icons right">cancel</i>
                    </button>
                    <form:input type="hidden" path="value" value="${value}"/>
                </p>
            </center>
            <div class="row">
                <div class="col s2 m2 l2 xl2">By Category:</div>
                <div class="col s2  m2 l2 xl2"><label>
                    <form:checkbox path="categoryList" value="Fiction"/>
                    <span>Fiction</span>
                </label></div>
                <div class="col s2  m2 l2 xl2"><label>
                    <form:checkbox path="categoryList" value="Non_Fiction"/>
                    <span>Non - Fiction</span>
                </label></div>
                <div class="col s2  m2 l2 xl2"><label>
                    <form:checkbox path="categoryList" value="Education"/>
                    <span>Educational</span>
                </label></div>
                <div class="col s2  m2 l2 xl2"><label>
                    <form:checkbox path="categoryList" value="Children"/>
                    <span>Children</span>
                </label></div>
                <div class="col s2  m2 l2 xl2"><label>
                    <form:checkbox path="categoryList" value="other"/>
                    <span>Other</span>
                </label></div>

            </div>
            <br/>
            <div class="row">
                <div class="col s2  m2 l2 xl2">By Rating:</div>
                <div class="col s2  m2 l2 xl2"><label>
                    <form:checkbox path="ratingList" value="5"/>
                    <span> <i class="material-icons right yellow-text">grade</i><i
                            class="material-icons right yellow-text">grade</i>
                        <i class="material-icons right yellow-text">grade</i><i
                                class="material-icons right yellow-text">grade</i>
                        <i class="material-icons right yellow-text">grade</i></span>
                </label></div>
                <div class="col s2  m2 l2 xl2"><label>
                    <form:checkbox path="ratingList" value="4"/>
                    <span><i class="material-icons right yellow-text">grade</i><i
                            class="material-icons right yellow-text">grade</i>
                        <i class="material-icons right yellow-text">grade</i><i
                                class="material-icons right yellow-text">grade</i></span>
                </label></div>
                <div class="col s2  m2 l2 xl2"><label>
                    <form:checkbox path="ratingList" value="3"/>
                    <span><i class="material-icons right yellow-text">grade</i><i
                            class="material-icons right yellow-text">grade</i>
                        <i class="material-icons right yellow-text">grade</i></span>
                </label></div>
                <div class="col s2  m2 l2 xl2"><label>
                    <form:checkbox path="ratingList" value="2"/>
                    <span><i class="material-icons right yellow-text">grade</i><i
                            class="material-icons right yellow-text">grade</i>
                       </span>
                </label></div>
                <div class="col s2  m2 l2 xl2"><label>
                    <form:checkbox path="ratingList" value="1"/>
                    <span><i class="material-icons right yellow-text">grade</i>
                       </span>
                </label></div>

            </div>

        </form:form>
    </div>
</div>

<div class="divider"></div>

<nav class="special-nav" style="background: #FFEBD7;">
    <div class="nav-wrapper special">


        <a href="${pageContext.request.contextPath}/home/show" data-target="mobile-demo2" class="sidenav-trigger"><i
                class="material-icons teal-text">menu</i></a>
        <ul class="right hide-on-med-and-down special-dropdown">
            <!-- Dropdown Trigger -->
            <li><a class="dropdown-trigger teal-text " href="#!" data-target="sort">Sort<i
                    class="material-icons right">sort</i></a></li>

            <li><a class="waves-effect waves-light modal-trigger teal-text" href="#filterModal">Filter
                <i class="material-icons right">filter_list</i></a>
            </li>

            <li><a class="teal-text" href="#" onclick="return false;" onClick="return false;"><div class="shoppingbasket">
                <div class="top"></div>
                <div class="bottom"></div>
                <div class="left"></div>
                <div class="right"></div>
            </div></a></li>

        </ul>
        <ul class="sidenav" id="mobile-demo2">
            <li><a class="dropdown-trigger teal-text " href="#!" data-target="sortMobile">Sort<i
                    class="material-icons right">sort</i></a></li>

            <li><a class="waves-effect waves-light modal-trigger teal-text" href="#filterModalMobile">Filter
                <i class="material-icons right">filter_list</i></a></li>
                <li>&npsp;&npsp;&npsp;&npsp;</li>
                <li><a class="teal-text" href="#" onclick="return false;" onClick="return false;"><div class="shoppingbasket">
                <div class="top"></div>
                <div class="bottom"></div>
                <div class="left"></div>
                <div class="right"></div>
            </div></a></li>


        </ul>
    </div>
</nav>
<div class="divider"></div>