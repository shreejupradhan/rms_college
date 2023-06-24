<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Teacher;
use App\Models\Day;
use App\Models\DayWiseSlot;
use Illuminate\Support\Facades\Session;

class AlgorithmController extends Controller
{
    public function teacher_wise_view(Request $request)
    {
        $teachers = Teacher::all()->pluck('id')->toArray();
        $teacher_id = request('teacher_id');
        $y_session_id = $request->y_session_id;

        try {

        $result = $this->binarySearch($teachers, (int) $teacher_id);
        if ($result) {
        $slots = Day::with(['routine' => function ($query) use ($teacher_id,$y_session_id) {
            $query->select('id','teacher_id','batch_id','section_id','room_id','day_id','time_slot_id','course_id','yearly_session_id','room_id')->where('teacher_id', $teacher_id)->where('yearly_session_id',$y_session_id);
        },'routine.course' => function ($query) {
            $query->select('id','course_name','course_code','course_type');
        },'routine.teacher' => function ($query) use ($teacher_id) {
            $query->select('id','user_id')->where('is_active','yes')->where('id', $teacher_id);
        },'routine.room' => function ($query) {
            $query->select('id','room_type','building','room_no')->where('is_active','yes');
        },'routine.batch' => function ($query) {
            $query->select('id','batch_no','department_id','shift_id')->where('is_active','yes');
        },'routine.batch.department' => function ($query) {
            $query->select('id','department_name')->where('is_active','yes');
        },'routine.batch.shift' => function ($query) {
            $query->select('id','slug')->where('is_active','yes');
        },'routine.batch.student.section_student.section' => function ($query) {
            $query->select('id','section_name')->where('is_active','yes');
        }
        ])->get();

        $day_wise_slots = DayWiseSlot::with('day','time_slot')->get();

        $teacher_detail = Teacher::with(['user','rank'])->where('is_active','yes')->where('id', $teacher_id)->first();

        return view('admin.routine.teacher_wise_view', compact('slots','y_session_id','teacher_detail','day_wise_slots'));

        } else {
           throw new \Exception ('Teacher does not exists');
        }
    } catch (\Exception $e){
        Session::flash('delete-message', $e->getMessage());
        return redirect()->back();
    }

    }
    public function binarySearch(array $arr, int $target): bool
    {
    $left = 0;
    $right = count($arr) - 1;


    while ($left <= $right) {
        $middle = floor(($left + $right) / 2);


        // Check if target is present at the mid point
        if ($arr[$middle] === $target) {
            return true;
        }

        // If target is greater, ignore left half
        if ($arr[$middle] < $target) {
            $left = $middle + 1;
        }
        // If target is smaller, ignore right half
        else {
            $right = $middle - 1;
        }
    }

    // Target is not present in array
    return false;

}

}
