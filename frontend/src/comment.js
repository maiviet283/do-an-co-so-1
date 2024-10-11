import React, { useEffect, useRef } from 'react';
import './css/comment.css';
import prevIcon from './assets/prev.png';
import nextIcon from './assets/next.png';
import avatar from './assets/avatar_1.png';
import star from './assets/star.png';

function Comment() {
    const listCommentRef = useRef(null);
    const translateY = useRef(0);
    const count = useRef(3);

    useEffect(() => {
        const nextButton = document.querySelector('.next button');
        const prevButton = document.querySelector('.prev button');
        const comment = listCommentRef.current;

        const handleNextClick = (event) => {
            event.preventDefault();
            if (count.current === 1) {
                return false;
            }
            translateY.current += -400;
            comment.style.transform = `translateY(${translateY.current}px)`;
            count.current--;
        };

        const handlePrevClick = (event) => {
            event.preventDefault();
            if (count.current === 3) {
                // Xem hết bình luận
                return false;
            }
            translateY.current += 400;
            comment.style.transform = `translateY(${translateY.current}px)`;
            count.current++;
        };

        nextButton.addEventListener('click', handleNextClick);
        prevButton.addEventListener('click', handlePrevClick);

        return () => {
            nextButton.removeEventListener('click', handleNextClick);
            prevButton.removeEventListener('click', handlePrevClick);
        };
    }, []);

    return (
        <div id="comment">
            <h2>NHẬN XÉT CỦA KHÁCH HÀNG</h2>
            <div id="comment-body">
                <div className="prev">
                    <button>
                        <img src={prevIcon} alt="Previous" />
                    </button>
                </div>
                <ul id="list-comment" ref={listCommentRef}>
                    {[
                        { name: "Nguyễn Đình Vũ", text: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.Lorem Ipsum is simply dummy text of the printing and typesetting industry." },
                        { name: "Trần Ngọc Sơn", text: "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s.Lorem Ipsum is simply dummy text of the printing and typesetting industry." },
                        { name: "Nguyễn Trần Vi", text: "An unknown printer took a galley of type and scrambled it to make a type specimen book.Lorem Ipsum is simply dummy text of the printing and typesetting industry." },
                    ].map((comment, index) => (
                        <li className="item" key={index}>
                            <div className="avatar">
                                <img id='avatar-1-png' src={avatar} alt="Avatar" />
                            </div>
                            <div className="stars">
                                {[...Array(5)].map((_, starIndex) => (
                                    <span key={starIndex}>
                                        <img src={star} alt="Star" />
                                    </span>
                                ))}
                            </div>
                            <div className="name">{comment.name}</div>
                            <div className="text">
                                <p>{comment.text}</p>
                            </div>
                        </li>
                    ))}
                </ul>
                <div className="next">
                    <button>
                        <img src={nextIcon} alt="Next" />
                    </button>
                </div>
            </div>
        </div>
    );
}

export default Comment;
