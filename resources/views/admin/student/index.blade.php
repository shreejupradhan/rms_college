@extends('layouts.app')

@section('title', 'Batch-Student')

@section('stylesheets')
    <!-- DataTables -->
    <link href="{{ asset('assets/plugins/datatables/dataTables.bootstrap4.min.css') }}" rel="stylesheet"
          type="text/css"/>
    <link href="{{ asset('assets/plugins/datatables/buttons.bootstrap4.min.css') }}" rel="stylesheet" type="text/css"/>
@endsection

@section('content')
    <div class="page-content-wrapper">
        <div class="container-fluid">
            <!-- end row -->
            <div class="row">
                <div class="col-xl-12">
                    <div class="card">
                        <div class="card-body">
                            <div class="mt-0 header-title mb-4">
                                Batch wise Student - Active Semester
                               
                            </div>
                            <div style="margin-bottom: 6rem;"> @foreach($shifts as $shift)

<a href="{{ route('students_create', $shift->id) }}" class="btn btn-sm btn-primary float-right ml-1">Add {{ $shift->shift_name }} Batch </a>

@endforeach</div>
                           
                            @if (Session::has('message'))
                                <div class="alert-dismissable alert alert-success">
                                    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">x
                                    </button>
                                    {{ Session('message') }}
                                </div>
                            @endif
                            @if (Session::has('delete-message'))
                                <div class="alert alert-danger alert-dismissable">
                                    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">x
                                    </button>
                                    {{ Session('delete-message') }}
                                </div>
                            @endif
                            <table id="datatable-buttons"
                                   class="table table-striped table-bordered dt-responsive nowrap"
                                   style="border-collapse: collapse; border-spacing: 0; width: 100%;">
                                <thead>
                                <tr>
                                    <th>#</th>
                                    <th>Batch</th>
                                    <th>Assigned On</th>
                                    <th>Number of student</th>
                                    {{-- <th>Section wise students</th>
                                    <th>Assign students Section</th> --}}
                                    <th>Action</th>
                                </tr>
                                </thead>

                                <tbody>

                                @foreach($students as $student)

                                    <tr>
                                        <td>{{ $student->id }}</td>
                                        <td>
                                            @if($student->batch)
                                            {{ $student->batch->department->department_name ."-". $student->batch->batch_no ."-".$student->batch->shift->slug  }}
                                                @endif
                                        </td>
                                        <td> {{
                                        $student->yearly_session != null ?
                                        $student->yearly_session->session->session_name.'-'.$student->yearly_session->year : '' }}</td>
                                        <td>{{ $student->number_of_student }}</td>
                                        {{-- <td>
                                            @php $count = count($student->section_student); $i=0 @endphp
                                            @foreach($student->section_student as $section_student)
                                                @php $i++ @endphp
                                                    <span class="bg-danger text-light p-1 m-0"><strong>{{ $section_student->section->section_name }}-{{ $section_student->students }}</strong></span>&nbsp;
                                            @endforeach
                                        </td>
                                        <td>
                                            <a href="{{ route('theory_section', $student->id) }}" class="btn btn-sm btn-primary">Theory Section</a>
                                            @if(count($student->section_student) != 0)
                                            <a href="{{ route('lab_section', $student->id) }}" class="btn btn-sm btn-primary">Lab Section</a>
                                            @endif
                                        </td> --}}
{{--                                        <td>{{ $student->is_active == 'yes' ? 'Active' : 'Inactive' }}</td>--}}
                                        <td>
                                            <a href="{{ route('students.edit', $student->id) }}"
                                               class="btn btn-sm btn-primary">Edit</a>

                                            <button type="button" class="btn btn-sm btn-danger" data-toggle="modal" data-target=".bs-example-modal-center{{$student->id}}">Delete</button>
                                        </td>
                                    </tr>
                                    <div class="modal fade bs-example-modal-center{{$student->id}}" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
                                        <div class="modal-dialog modal-dialog-centered">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5>Are you sure? You want to delete this?</h5>
                                                </div>
                                                <div class="modal-body">
                                                    {!! Form::open(['route' => ['students.destroy', $student->id ], 'method' => 'delete', 'style' => 'display:inline']) !!}
                                                    {!! Form::submit('Yes', ['class' => 'btn btn-lg btn-danger']) !!}
                                                    {!! Form::close() !!}
                                                    <button type="button" class="btn btn-lg btn-primary waves-effect waves-light" data-toggle="modal" data-target=".bs-example-modal-center{{$student->id}}"> No </button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                @endforeach
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>

            </div>
            <!-- end row -->
        </div>
        <!-- end container-fluid -->
    </div>
    <!-- end page content-->

    </div>
    <!-- page wrapper end -->
@endsection


@push('script')
    <!-- Datatable init js -->

    <!-- Required datatable js -->
    <script src="{{ asset('assets/plugins/datatables/jquery.dataTables.min.js') }}"></script>
    <script src="{{ asset('assets/plugins/datatables/dataTables.bootstrap4.min.js') }}"></script>
    <script src="{{ asset('assets/plugins/datatables/dataTables.buttons.min.js') }}"></script>
    <script src="{{ asset('assets/plugins/datatables/jszip.min.js') }}"></script>
    <script src="{{ asset('assets/plugins/datatables/pdfmake.min.js') }}"></script>
    <script src="{{ asset('assets/plugins/datatables/vfs_fonts.js') }}"></script>
    <script src="{{ asset('assets/plugins/datatables/buttons.bootstrap4.min.js') }}"></script>
    <script src="{{ asset('assets/plugins/datatables/jszip.min.js') }}"></script>
    <script src="{{ asset('assets/plugins/datatables/buttons.html5.min.js') }}"></script>
    <script src="{{ asset('assets/plugins/datatables/buttons.print.min.js') }}"></script>
    <script src="{{ asset('assets/plugins/datatables/buttons.colVis.min.js') }}"></script>
    <script src="../../../../.."></script>
    <!-- Buttons examples -->


    <script>
        $(document).ready(function () {
            $('#datatable').DataTable();

            //Buttons examples
            let table = $('#datatable-buttons').DataTable({
                lengthChange: false,
                buttons: ['copy', 'excel', 'pdf', 'print']
            });

            table.buttons().container()
                .appendTo('#datatable-buttons_wrapper .col-md-6:eq(0)');
        });
    </script>
@endpush
