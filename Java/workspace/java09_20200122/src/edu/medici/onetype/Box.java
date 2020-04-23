package edu.medici.onetype;

// 하나의 타입으로 정하고 사용할 경우
public class Box<T> {
    private T t;
    public T get(){
        return t;
    }
    public void set(T t){
        this.t = t;
    }
}